import subprocess, os

def shell_source(script):
    """Sometime you want to emulate the action of "source" in bash,
    settings some environment variables. Here is a way to do it."""
    pipe = subprocess.Popen(f". {script}; env", stdout=subprocess.PIPE, shell=True)
    output = pipe.communicate()[0]
    env_bytes = dict( (line.split(b"=", 1) for line in output.splitlines()) )
    env = {k.decode(): v.decode() for k, v in env_bytes.items()} 
    os.environ.update(env)
