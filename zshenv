if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

XDG_RUNTIME_DIR=/run/user/$(id -u)

DOTNET_CLI_TELEMETRY_OPTOUT=1
test -f "${HOME}/.cargo/env" && . "${HOME}/.cargo/env"

ELM_SCALE=2
