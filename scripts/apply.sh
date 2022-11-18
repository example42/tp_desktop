#!/usr/bin/env bash
script=$(readlink -f "$0")
scripts_dir=$(dirname "$script")
repo_dir=$(dirname "$scripts_dir")
echo $repo_dir
echo $scripts_dir
. "${scripts_dir}/functions"
PATH=$PATH:/opt/puppetlabs/puppet/bin
manifest="${repo_dir}/manifests/site.pp"
hostn=$1
verbose_options='--verbose --report --show_diff --summarize --detailed-exitcodes'
echo_title "Applying tp settings for $hostn"
puppet apply $verbose_options \
	--modulepath "${repo_dir}/site:${repo_dir}/modules:/etc/puppetlabs/code/modules" \
	--environmentpath "${repo_dir}" \
	--hiera_config="${repo_dir}/hiera.yaml" \
	$extra_options $manifest