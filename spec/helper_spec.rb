RSpec.describe ContainerHelpers do
  describe "run!" do
    it "executes a command and returns the exit status and output" do
      status, stdout, stderr = run!("echo hello world")
      expect(status).to eq(0)
      expect(stdout).to eq("hello world\n")
      expect(stderr).to eq("")
    end

    it "kills a command which times out and returns SIGKILL" do
      status, stdout, stderr = run!("sleep 1", timeout=0.25)
      expect(status).to eq(9)
    end
  end

  describe "generate_podman_command" do
    it "adds the OCI archive flag" do
      expect(generate_podman_command("echo hello world", "img/image.tar")).to eq(
        %(podman run "oci-archive:img/image.tar" echo hello world),
      )
    end
  end
end
