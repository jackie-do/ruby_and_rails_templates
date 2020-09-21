# This is a skeleton for testing models including examples of validations, callbacks,
# scopes, instance & class methods, associations, and more.
# Pick and choose what you want, as all models don't NEED to be tested at this depth.
#
# I'm always eager to hear new tips & suggestions as I'm still new to testing,
# so if you have any, please share!
#
# @kyletcarlson
#
# This skeleton also assumes you're using the following gems: 
# 
# rspec-rails: https://github.com/rspec/rspec-rails
# Shoulda-matchers: https://github.com/thoughtbot/shoulda-matchers
# shoulda-callback-matchers: https://github.com/beatrichartz/shoulda-callback-matchers
# factory_girl_rails: https://github.com/thoughtbot/factory_girl_rails

require 'spec_helper'

describe Model do
  
  it "has a valid factory" do
    # Using the shortened version of FactoryGirl syntax.
    # Add:  "config.include FactoryGirl::Syntax::Methods" (no quotes) to your spec_helper.rb
    expect(build(:factory_you_built)).to be_valid
  end

  # Lazily loaded to ensure it's only used when it's needed
  # RSpec tip: Try to avoid @instance_variables if possible. They're slow.
  let(:factory_instance) { build(:factory_you_built) }
  
  describe "ActiveModel validations" do
    # http://guides.rubyonrails.org/active_record_validations.html
    # http://rubydoc.info/github/thoughtbot/shoulda-matchers/master/frames
    # http://rubydoc.info/github/thoughtbot/shoulda-matchers/master/Shoulda/Matchers/ActiveModel

    # Basic validations
    it { expect(bodybuilder).to validate_presence_of(:food).with_message(/you can't get big without your protein!/) }
    it { expect(developer).to validate_presence_of(:favorite_coffee) }
    it { expect(meal).to validate_numericality_of(:price) }
    it { expect(tumblog).to validate_numericality_of(:follower_count).only_integer }
    it { expect(odd_number).to validate_numericality_of(:value).odd }
    it { expect(even_number).to validate_numericality_of(:value).even }
    it { expect(mercedes).to validate_numericality_of(:price).is_greater_than(30000) }
    it { expect(junked_car).to validate_numericality_of(:price).is_less_than_or_equal_to(500) }
    it { expect(blog_post).to validate_uniqueness_of(:title) }
    it { expect(wishlist).to validate_uniqueness_of(:product).scoped_to(:user_id, :wishlist_id).with_message("You can only have an item on your wishlist once.") }

    # Format validations
    it { expect(user).to allow_value("JSON Vorhees").for(:name) }
    it { expect(user).to_not allow_value("Java").for(:favorite_programming_language) }
    it { expect(user).to allow_value("dhh@nonopinionated.com").for(:email) }
    it { expect(user).to_not allow_value("base@example").for(:email) }
    it { expect(user).to_not allow_value("blah").for(:email) }
    it { expect(blog).to allow_blank(:connect_to_facebook) }
    it { expect(blog).to allow_nil(:connect_to_facebook) }

    # Inclusion/acceptance of values
    it { expect(tumblog).to ensure_inclusion_of(:status).in_array(['draft', 'public', 'queue']) }
    it { expect(tng_group).to ensure_inclusion_of(:age).in_range(18..35) }
    it { expect(band).to ensure_length_of(:bio).is_at_least(25).is_at_most(1000) }
    it { expect(tweet).to ensure_length_of(:content).is_at_most(140) }
    it { expect(applicant).to ensure_length_of(:ssn).is_equal_to(9) }
    it { expect(contract).to validate_acceptance_of(:terms) }  # For boolean values
    it { expect(user).to validate_confirmation_of(:password) }  # Ensure two values match
  end

  describe "ActiveRecord associations" do
    # http://guides.rubyonrails.org/association_basics.html
    # http://rubydoc.info/github/thoughtbot/shoulda-matchers/master/frames 
    # http://rubydoc.info/github/thoughtbot/shoulda-matchers/master/Shoulda/Matchers/ActiveRecord

    # Performance tip: stub out as many on create methods as you can when you're testing validations 
    # since the test suite will slow down due to having to run them all for each validation check.
    #
    # For example, assume a User has three methods that fire after one is created, stub them like this:
    #
    # before(:each) do
    #   User.any_instance.stub(:send_welcome_email)
    #   User.any_instance.stub(:track_new_user_signup)
    #   User.any_instance.stub(:method_that_takes_ten_seconds_to_complete)
    # end
    #
    # If you performed 5-10 validation checks against a User, that would save a ton of time.

    # Associations
    it { expect(profile).to belong_to(:user) }
    it { expect(wishlist_item).to belong_to(:wishlist).counter_cache }
    it { expect(metric).to belong_to(:analytics_dashboard).touch }
    it { expect(user).to have_one(:profile }
    it { expect(classroom).to have_many(:students) }
    it { expect(initech_corporation).to have_many(:employees).with_foreign_key(:worker_drone_id) }
    it { expect(article).to have_many(:comments).order(:created_at) }
    it { expect(user).to have_many(:wishlist_items).through(:wishlist) }
    it { expect(todo_list).to have_many(:todos).dependent(:destroy) }
    it { expect(account).to have_many(:billings).dependent(:nullify) }
    it { expect(product).to have_and_belong_to_many(:descriptors) }
    it { expect(gallery).to accept_nested_attributes_for(:paintings) }
    
    # Read-only matcher
    # http://rubydoc.info/github/thoughtbot/shoulda-matchers/master/Shoulda/Matchers/ActiveRecord/HaveReadonlyAttributeMatcher
    it { expect(asset).to have_readonly_attribute(:uuid) }

    # Databse columns/indexes
    # http://rubydoc.info/github/thoughtbot/shoulda-matchers/master/Shoulda/Matchers/ActiveRecord/HaveDbColumnMatcher
    it { expect(user).to have_db_column(:political_stance).of_type(:string).with_options(default: 'undecided', null: false)
    # http://rubydoc.info/github/thoughtbot/shoulda-matchers/master/Shoulda/Matchers/ActiveRecord:have_db_index
    it { expect(user).to have_db_index(:email).unique(:true)
  end

  context "callbacks" do
    # http://guides.rubyonrails.org/active_record_callbacks.html
    # https://github.com/beatrichartz/shoulda-callback-matchers/wiki
    
    let(:user) { create(:user) }

    it { expect(user).to callback(:send_welcome_email).after(:create) }
    it { expect(user).to callback(:track_new_user_signup).after(:create) }
    it { expect(user).to callback(:make_email_validation_ready!).before(:validation).on(:create) }
    it { expect(user).to callback(:calculate_some_metrics).after(:save) }
    it { expect(user).to callback(:update_user_count).before(:destroy) }
    it { expect(user).to callback(:send_goodbye_email).before(:destroy) }
  end

  describe "scopes" do
    # It's a good idea to create specs that test a failing result for each scope, but that's up to you
    it ".loved returns all votes with a score > 0" do
      product = create(:product)
      love_vote = create(:vote, score: 1, product_id: product.id)
      expect(Vote.loved.first).to eq(love_vote)
    end

    it "has another scope that works" do
      expect(model.scope_name(conditions)).to eq(result_expected)
    end
  end

  describe "public instance methods" do
    context "responds to its methods" do
      it { expect(factory_instance).to respond_to(:public_method_name) }
      it { expect(factory_instance).to respond_to(:public_method_name) }
    end

    context "executes methods correctly" do
      context "#method name" do
        it "does what it's supposed to..."
          expect(factory_instance.method_to_test).to eq(value_you_expect)
        end

        it "does what it's supposed to..."
          expect(factory_instance.method_to_test).to eq(value_you_expect)
        end
      end
    end
  end

  describe "public class methods" do
    context "responds to its methods" do
      it { expect(factory_instance).to respond_to(:public_method_name) }
      it { expect(factory_instance).to respond_to(:public_method_name) }
    end

    context "executes methods correctly" do
      context "self.method name" do
        it "does what it's supposed to..."
          expect(factory_instance.method_to_test).to eq(value_you_expect)
        end
      end
    end
  end

end
