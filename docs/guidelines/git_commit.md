### The perfect commit
A good commit message should tell you what has changed and why. The how, that is, how to make these changes, does not have to be explained. Reading the code and highlighting changes via a diffis self-explanatory.


Here is the format we must adopted
```bash
<type>(<scope>): <subjet>

<description>

<footer>
```

Here we see the different parts of a commit and what they should include. Let's see these elements in detail.

The first line has three elements: type, scope and subject. Let's see what they consist of.


### Type of commit
The type informs us of the type of commit. 9 types are available:

- **build** : changes that affect the build system or external dependencies (gems, rake, npm, make ...)
- **ci** : changes concerning integration or configuration files and scripts (Travis, Ansible, BrowserStack ...)
- **feature** : addition of a new feature
- **fix** : bug fixed
- **perf** : performance improvement
- **refactor** : modification that does not bring new functionality or performance improvement
- **style** : change which does not bring any functional or semantic alteration (indentation, formatting, addition of space, renaming of a variable, etc.)
- **docs** : writing or updating documentation
- **test** : addition or modification of tests


### The affected part (**scope**)
This is the second element of the first line. It immediately lets us know which part of the project is affected. For example for an e-commerce site, we could have product , cart or checkout .

This element is optional. Indeed, it is sometimes not relevant.

### The subject
The topic contains a brief description of the changes. In general, it is limited to 50 characters.

To adopt an effective descriptive style, we use the present imperative: add , change , update , remove and not changed or removed . add caching for better performancefor example.

Follow the guide style and do not capitalize the first letter of the subject or put a dot at the end. The main thing is to adopt a policy and stick to it in order to be consistent.

The body of the message
Many ignore it, but the messages may have a body in which the reason for the changes can be explained in more detail. As for the subject, we will use the present imperative.

Again, this explains the reason for the change and how this new way is different from the previous state.

The how is visible directly in the code. Moreover, if the code is complex, now is the time to think about commenting on it if you haven't already!

### The commit footer
Like the body of the message, the footer is optional. It will also be used less often.

We reserve the footer for breaking changes and we also refer to the error ticket that regulates the changes if necessary.



- **link**: Jira ticket link
- **refs**: Jira ticket ref
- **fixes**: refs of issues separate by ","


### Smile (Emoji Icons)
We see more and more the use of emojis in commits. [Gitmoji](https://gitmoji.carloscuesta.me/) is a project that aims to define a style guide for the use of emojis in commits.

![Image of Smile](https://github.com/jackiedo91/ruby_and_rails_templates/blob/master/docs/images/git-emojis-hooks.png)

Emojis can quickly and visually convey meaning. Plus, a little fun in the posts can't hurt.

On the other hand, using too wide a palette of emojis in subjects can lead to confusion as it is not always obvious that 🚀 relates to deployment.

So I only use a limited number of icons that correspond to the different types of commits.

In addition, I prefer the use of emojis in Unicode format rather than using Markdown codes. Thus, emojis are displayed in all environments that support Unicode - which is much more common than environments that support Markdown.

|   Commit type              | Emoji                                         |
|:---------------------------|:----------------------------------------------|
| Initial commit             | :tada: `:tada:`                               |
| Version tag                | :bookmark: `:bookmark:`                       |
| New feature                | :sparkles: `:sparkles:`                       |
| Bugfix                     | :bug: `:bug:`                                 |
| Metadata                   | :card_index: `:card_index:`                   |
| Documentation              | :books: `:books:`                             |
| Documenting source code    | :bulb: `:bulb:`                               |
| Performance                | :racehorse: `:racehorse:`                     |
| Cosmetic                   | :lipstick: `:lipstick:`                       |
| Tests                      | :rotating_light: `:rotating_light:`           |
| Adding a test              | :white_check_mark: `:white_check_mark:`       |
| Make a test pass           | :heavy_check_mark: `:heavy_check_mark:`       |
| General update             | :zap: `:zap:`                                 |
| Improve format/structure   | :art: `:art:`                                 |
| Refactor code              | :hammer: `:hammer:`                           |
| Removing code/files        | :fire: `:fire:`                               |
| Continuous Integration     | :green_heart: `:green_heart:`                 |
| Security                   | :lock: `:lock:`                               |
| Upgrading dependencies     | :arrow_up: `:arrow_up:`                       |
| Downgrading dependencies   | :arrow_down: `:arrow_down:`                   |
| Lint                       | :shirt: `:shirt:`                             |
| Translation                | :alien: `:alien:`                             |
| Text                       | :pencil: `:pencil:`                           |
| Critical hotfix            | :ambulance: `:ambulance:`                     |
| Deploying stuff            | :rocket: `:rocket:`                           |
| Fixing on MacOS            | :apple: `:apple:`                             |
| Fixing on Linux            | :penguin: `:penguin:`                         |
| Fixing on Windows          | :checkered_flag: `:checkered_flag:`           |
| Work in progress           | :construction:  `:construction:`              |
| Adding CI build system     | :construction_worker: `:construction_worker:` |
| Analytics or tracking code | :chart_with_upwards_trend: `:chart_with_upwards_trend:` |
| Removing a dependency      | :heavy_minus_sign: `:heavy_minus_sign:`       |
| Adding a dependency        | :heavy_plus_sign: `:heavy_plus_sign:`         |
| Docker                     | :whale: `:whale:`                             |
| Configuration files        | :wrench: `:wrench:`                           |
| Package.json in JS         | :package: `:package:`                         |
| Merging branches           | :twisted_rightwards_arrows: `:twisted_rightwards_arrows:` |
| Bad code / need improv.    | :hankey: `:hankey:`                           |
| Reverting changes          | :rewind: `:rewind:`                           |
| Breaking changes           | :boom: `:boom:`                               |
| Code review changes        | :ok_hand: `:ok_hand:`                         |
| Accessibility              | :wheelchair: `:wheelchair:`                   |
| Move/rename repository     | :truck: `:truck:`                             |
| Other                      | [Be creative](http://www.emoji-cheat-sheet.com/)  |


## Examples of commits

```bash
feature(student): import student from CSV file

Added the possibility to create or update a contact with the custom fields.
The changes are :
    - contracts
    - services
    - serializers

link: https://jira.com/browse/ABC-120
refs: ABC-120
```


```bash
fix(note): note update error

Fix error occured pending not update and add more test case.

link: https://jira.com/browse/ABC-123
refs: ABC-123
fixes: 52
```

