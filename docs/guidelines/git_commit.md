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




## Examples of commits



