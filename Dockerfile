FROM julia

COPY . /src

WORKDIR /src

RUN julia --project --check-bounds=yes -e 'import Pkg; Pkg.build()'
RUN julia --project --check-bounds=yes -e 'import Pkg; Pkg.test("Stable"; coverage=true)'

ENTRYPOINT echo "sucess"
