> package.json
```json
{
  "name": "event_management",
  "private": true,
  "dependencies": {
    "@rails/actioncable": "^6.0.0",
    "@rails/activestorage": "^6.0.0",
    "@rails/ujs": "^6.0.0",
    "@rails/webpacker": "4.2.2",
    "alertifyjs": "^1.13.1",
    "bootstrap": "4.3.1",
    "i18n-js": "^3.7.1",
    "jquery": "^3.5.1",
    "jquery-datetimepicker": "^2.5.21",
    "lodash": "^4.17.20",
    "popper.js": "^1.16.1",
    "rails-erb-loader": "^5.5.2",
    "stimulus": "^1.1.1",
    "turbolinks": "^5.2.0",
    "validate.js": "^0.13.1",
    "validator": "^13.1.1"
  },
  "version": "0.1.0",
  "devDependencies": {
    "webpack-dev-server": "^3.11.0"
  }
}

```

> application.js
```js
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Config to use jquery as $ sign
window.jQuery = $
window.$ = $

import "bootstrap"
// Jquery Datetimepicker
import 'jquery-datetimepicker/build/jquery.datetimepicker.full'

// Config for alertifyjs to notify messages
import { alertify } from './../lib/alertifyjs/init'
window.alertify = alertify

// Config for I18n js
import I18n from './../lib/i18n-js/init.js.erb'
window.I18n = I18n

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

////
// Import all controllers of Stimulus
////
import 'controllers'
```
