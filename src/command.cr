require "./data"

# Class for generating the Kubeconfig files for setting up a simple kubernetes cluster
# The goal was to make the kubeconfig file generation in Kubernetes the hard way
# much simpler.
class Command
  def gen_commands(name, ip, system_name)
    <<-COMMANDS
    kubectl config set-cluster kubernetes-the-hard-way \
      --certificate-authority=ca.crt \
      --embed-certs=true \
      --server=https://#{ip}:6443 \
      --kubeconfig=#{name}.kubeconfig

    kubectl config set-credentials #{system_name} \
      --client-certificate=#{name}.crt \
      --client-key=#{name}.key \
      --embed-certs=true \
      --kubeconfig=#{name}.kubeconfig

    kubectl config set-context default \
      --cluster=kubernetes-the-hard-way \
      --user=#{system_name} \
      --kubeconfig=#{name}.kubeconfig

    kubectl config use-context default --kubeconfig=#{name}.kubeconfig
    COMMANDS
  end

  def gen(name, ip, system_name, verbose = true, live = false)
    str = gen_commands(name, ip, system_name)
    puts "---commands---", str if verbose
    str.lines.each { |line| `#{line}` } if live
  end
end