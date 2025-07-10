# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "@stimulus-components/rails-nested-form", to: "@stimulus-components--rails-nested-form.js" # @5.0.0
pin "@stimulus-components/dropdown", to: "@stimulus-components--dropdown.js" # @3.0.0
pin "stimulus-use" # @0.52.3
pin "@rails/request.js", to: "@rails--request.js.js" # @0.0.12
pin "lodash", to: "https://ga.jspm.io/npm:lodash@4.17.21/lodash.js"
pin "lodash/debounce", to: "https://ga.jspm.io/npm:lodash@4.17.21/debounce.js"
pin "turbo_power", to: "https://ga.jspm.io/npm:turbo_power@0.1.6/dist/index.js"
