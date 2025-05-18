set -gx PATH "$HOME/.cargo/bin" $PATH;
set -gx PATH "$HOME/.local/bin" $PATH;
set -gx GOROOT $(go env GOROOT)
set -gx GOPATH $(go env GOPATH)
set -gx GOBIN $(go env GOPATH)/bin
set -gx PATH $PATH $GOBIN $GOPATH $GOROOT;
