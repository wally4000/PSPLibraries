test_deps_install SDL2 freetype
get_pspport SDL_ttf SDL2_ttf-psp

# This is used when there is no pkg-config, but needs sdl2-config
#EXTRA_FLAGS="--with-sdl-prefix=$(psp-config --psp-prefix)"
# This is used when there is no pkg-config, but needs freetype-config
EXTRA_FLAGS="$EXTRA_FLAGS --with-freetype-prefix=$(psp-config --psp-prefix)"
# Force pkg-config flags, until our SDL2 ships it
PKG_CONFIG_LIBDIR="$(psp-config --psp-prefix)/lib/pkgconfig" \
  SDL_CFLAGS="-I$(psp-config --psp-prefix)/include/SDL2" SDL_LIBS="-lSDL2" \
  run_autogen_build $EXTRA_FLAGS --without-x
