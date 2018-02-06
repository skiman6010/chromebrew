require 'package'

class Graphene < Package
  description 'A thin layer of graphic data types'
  homepage 'https://github.com/ebassi/graphene'
  version '1.6.0'
  source_url 'https://github.com/ebassi/graphene/archive/1.6.0.tar.gz'
  source_sha256 '98970f859e452ce421b72726ca727fdf3ac27cb4804b62bfe520157fa46aa2fd'

  depends_on 'ninja'
  depends_on 'python3'
  depends_on 'gobject_introspection'

  def self.build
    system "pip3 install --prefix #{CREW_PREFIX} --root #{CREW_DEST_DIR} meson"    # depends_on meson
    system "meson _build --prefix=#{CREW_PREFIX} --libdir=#{CREW_LIB_PREFIX} -Denable-arm-neon=false"
  end

  def self.install
    Dir.chdir("_build") do
     system "ninja test"
     system "ninja install"
    end
  end
end
