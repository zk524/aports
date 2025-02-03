# Maintainer: Dimitrios Desyllas <pcmagas@disroot.org>
pkgname=mkdotenv
pkgver=0.4.2
pkgrel=0
pkgdesc="Lightweight and efficient tool for managing your .env files."
url="https://github.com/pc-magas/mkdotenv"
arch="all"
license="GPL-3.0-only"
makedepends="go"
source="$pkgname-$pkgver.tar.gz::https://github.com/pc-magas/mkdotenv/releases/download/v$pkgver/mkdotenv-$pkgver.tar.gz"
options="!check" # No tests

build() {
	make VERSION="$pkgver"
}

package() {
	make -C "$srcdir" install_bin DESTDIR="$pkgdir" INSTALL_BIN_DIR=/usr/bin
}

sha512sums="
6e371e1238e8fbcd91b5c13829c23831828fa071f93c8a77ec5c9c310ea0c19a08718075853f75ca6467f9dc84418db8673bec38704f3fb715623b0d82149f6f  mkdotenv-0.4.2.tar.gz
"
