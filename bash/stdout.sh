# Registers STDOUT and STDERR to log file
exec >  >(tee -a foo.log)
exec 2> >(tee -a foo.log >&2)
# -a appends log, without it overwrites old log