require "timeout"

module ContainerHelpers
  def run!(command, timeout=5)
    ro, wo = IO.pipe
    re, we = IO.pipe

    exitcode = nil
    pid = Process.spawn(command, out: wo, err: we)
    begin
      exitcode = ::Timeout::timeout(timeout) do
        _, status = Process.wait2(pid)
        status.exitstatus
      end
    rescue Timeout::Error
      Process.kill('KILL', pid)
      exitcode = 9
    end

    [wo, we].each(&:close)
    out, err= ro.readlines.join("\n"), re.readlines.join("\n")
    [ro, re].each(&:close)

    [exitcode, out, err]
  end

  def generate_podman_command(command, path)
    %(podman run "oci-archive:#{path}" #{command})
  end

  def run_in_container!(command, path, timeout=5)
    run!(
      generate_podman_command(command, path),
      timeout=timeout,
    )
  end
end

RSpec.configure do |c|
  c.include ContainerHelpers
end
