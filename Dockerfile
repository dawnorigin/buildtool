FROM dawnorigin/buildenv

RUN pip install conan

RUN gem install ceedling

RUN set -ex \
	\
	&& mkdir /cfg \
	&& cd /tmp \
  && curl -L https://github.com/danmar/cppcheck/archive/1.80.tar.gz | tar xz \
  && cd cppcheck-1.80 \
  && SRCDIR=build CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" make \
  && SRCDIR=build CFGDIR=/cfg HAVE_RULES=yes CXXFLAGS="-O2 -DNDEBUG -Wall -Wno-sign-compare -Wno-unused-function" make install \
  && cd \
  && rm -r /tmp/cppcheck-1.80
  
