module main

import os
import nedpals.vargs

const (
	version = '1.0.0-alpha1'
)

fn main() {
	mut args := vargs.new(os.args, 1)
	args.alias('help', 'h')
	args.alias('version', 'v')
	args.parse()
	if 'help' in args.options || 'h' in args.options {
		help()
		return
	}
	if 'version' in args.options || 'v' in args.options {
		version()
		return
	}
	match args.command {
		'process' { process() }
		'help' { help() }
		'version' { version() }
		else { fallback(args.command) }
	}
}

fn process() {
	println('Executed process command')
}

fn help() {
	println('Usage: archiver [-h|--help] [-v|--version] [process|help|version]')
}

fn version() {
	println('archiver v$version')
}

fn fallback(cmd string) {
	println('command "$cmd" not found')
}
