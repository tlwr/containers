RSpec.describe "rspec-podman" do
  it "has podman installed" do
    status, _, _ = run_in_container!("command -v podman", ENV["CONTAINER_PATH"])
    expect(status).to eq(0)
  end

  it "has rspec installed" do
    status, _, _ = run_in_container!("command -v rspec", ENV["CONTAINER_PATH"])
    expect(status).to eq(0)
  end
end
