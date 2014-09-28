%(PHONY): bootstrap
bootstrap:
	bundle install --no-deployment
	bundle exec librarian-puppet install

%(PHONY): test
test:
	bundle exec rake test

%(PHONY): package
package:
	bundle install --deployment
	bundle exec librarian-puppet install
	# TODO Replace below with Parcel call
	fpm -s dir -t deb -n doismellburning-puppet --depends bundler --prefix /opt/doismellburning/puppet --exclude .git --deb-user root --deb-group root .

%(PHONY): apply
apply:
	# TODO Lockfile, reporting, etc.
	# TODO Doesn't belong here, but is useful/sufficient for dev
	bundle exec puppet apply --modulepath=./modules:./internal --hiera_config=./hiera.yaml --write-catalog-summary ./manifests/site.pp
