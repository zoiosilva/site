run() {
    # Run the compilation process.
    cd $PLATFORM_CACHE_DIR || exit 1;

    if [ ! -f "${PLATFORM_CACHE_DIR}/pecl-php-uploadprogress/modules/uploadprogress.so" ]; then
        ensure_source
        checkout_version "$1"
        compile_source
    fi

    copy_lib
    enable_lib
}

enable_lib() {
    # Tell PHP to enable the extension.
    echo "Enabling uploadprogress extension."
    echo "extension=${PLATFORM_APP_DIR}/uploadprogress.so" >> $PLATFORM_APP_DIR/php.ini
}

copy_lib() {
    # Copy the compiled library to the application directory.
    echo "Installing uploadprogress extension."
    cp $PLATFORM_CACHE_DIR/pecl-php-uploadprogress/modules/uploadprogress.so $PLATFORM_APP_DIR
}

checkout_version () {
    # Check out the specific Git tag that we want to build.
    git checkout "$1"
}

ensure_source() {
    # Ensure that the extension source code is available and up to date.
    if [ -d "pecl-php-uploadprogress" ]; then
        cd pecl-php-uploadprogress || exit 1;
        git fetch --all --prune
    else
        git clone https://github.com/php/pecl-php-uploadprogress.git
        cd pecl-php-uploadprogress || exit 1;
    fi
}

compile_source() {
    # Compile the extension.
    phpize
    ./configure
    make
}

ensure_environment() {
    # If not running in a Platform.sh build environment, do nothing.
    if [[ -z "${PLATFORM_CACHE_DIR}" ]]; then
        echo "Not running in a Platform.sh build environment. Aborting uploadprogress installation."
        exit 0;
    fi
}

ensure_arguments() {
    # If no version was specified, don't try to guess.
    if [ -z $1 ]; then
        echo "No version of the uploadprogress extension specified. You must specify a tagged version on the command line."
        exit 1;
    fi
}

ensure_environment
ensure_arguments "$1"
run "$1"
