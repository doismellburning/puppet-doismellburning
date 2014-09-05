require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'

PuppetLint.configuration.fail_on_warnings = true

PuppetLint.configuration.send('disable_80chars') # The puppet-generated `tests/init.pp` doesn't obey this, so we won't
PuppetLint.configuration.send("disable_arrow_alignment") # Vertically aligning arrows seems tedious and pointless
PuppetLint.configuration.send('disable_class_inherits_from_params_class') # Don't care about pre-2.7
PuppetLint.configuration.send("disable_only_variable_string") # Strings just containing a variable are needed in certain cases for type wrangling

# When inheriting pre-written manifests, you may wish to uncomment the below; I would rather start with the warnings enabled
# PuppetLint.configuration.send('disable_documentation')
# PuppetLint.configuration.send('disable_double_quoted_strings')

exclude_paths = [
  "modules/**/*",
  "vendor/**/*",
]

PuppetLint.configuration.ignore_paths = exclude_paths
PuppetSyntax.exclude_paths = exclude_paths

task :test => [
  :syntax,
  :lint,
]
