// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import { Turbo } from "@hotwired/turbo-rails"
import "controllers"
import TurboPower from "turbo_power"

import "trix"
import "@rails/actiontext"

TurboPower.initialize(Turbo.StreamActions);
