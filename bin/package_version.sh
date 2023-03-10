#!/usr/bin/env bash

function build_num_from_file {
	version=$(< "$1")
	version=${version##*-}
	version=${version%%+*}
	version=${version%%~*}
	echo -n "$version"
}

while getopts ":N:V:" flag; do
	case "$flag" in
		:)	echo "$0: Option -$OPTARG requires an argument." 1>&2
			exit 1
			;;
		\?)	echo "$0: What're you talking about?" 1>&2
			exit 1
			;;
		N)	package="$OPTARG" ;;
		V)	version="$OPTARG" ;;
	esac
done

if [[ ! -d "${_THEOS_LOCAL_DATA_DIR}/packages" ]]; then
	if [[ -d "${THEOS_PROJECT_DIR}/.debmake" ]]; then
		mkdir -p "${_THEOS_LOCAL_DATA_DIR}"
		mv "${THEOS_PROJECT_DIR}/.debmake" "${_THEOS_LOCAL_DATA_DIR}/packages"
	else
		mkdir -p "${_THEOS_LOCAL_DATA_DIR}/packages"
	fi
fi

versionfile="${_THEOS_LOCAL_DATA_DIR}/packages/$package-$version"
build_number=0

if [[ ! -e "$versionfile" ]]; then
	build_number=1
else
	build_number=$(build_num_from_file "$versionfile")
	let build_number++
fi

echo -n "$build_number" > "$versionfile"
echo "$build_number"
