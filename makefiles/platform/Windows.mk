ifeq ($(_THEOS_PLATFORM_LOADED),)
_THEOS_PLATFORM_LOADED := 1
THEOS_PLATFORM_NAME := windows

_THEOS_PLATFORM_DEFAULT_TARGET := iphone
_THEOS_PLATFORM_DU_EXCLUDE := --exclude
_THEOS_PLATFORM_MD5SUM := md5sum
_THEOS_PLATFORM_SHOW_IN_FILE_MANAGER := explorer /select,
_THEOS_PLATFORM_SHOW_IN_FILE_MANAGER_PATH_TRANSLATOR := cygpath -aw
_THEOS_PLATFORM_GET_LOGICAL_CORES := nproc
endif