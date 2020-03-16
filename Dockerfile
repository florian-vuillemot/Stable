FROM julia

COPY . /src

WORKDIR /src

ENTRYPOINT julia --project --check-bounds=yes -e 'import Pkg; Pkg.build(); Pkg.test("Stable"; coverage=true)'
