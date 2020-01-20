require "admiral"
require "./command"
require "./data"

class Main < Admiral::Command
  define_help

  define_argument name,
    description: "The name of the server",
    required: true

  define_argument ip,
    description: "The IP address of the server",
    required: true

  define_argument system_name,
    description: "The special name of the component in the Kubernetes system",
    required: true

  define_flag verbose : Bool,
    description: "Output the actual kubectl commands that are used to generate the kubeconfig file",
    default: false,
    short: "v"

  define_flag dry_run : Bool,
    description: "Don't actually generate the kubeconfig file (also turns on verbose mode)",
    default: false,
    short: "v"

  def run
    check_command unless flags.dry_run

    # If dry-run is set then we automatically turn on verbose mode as this is the main
    # reason to run in dry-run mode. Some may wish to use this as a saftey switch but
    # they can just not call the command so I'll only cater to the common use case.
    verbose = flags.dry_run || flags.verbose

    kc = Command.new
    kc.gen(
      arguments.name,
      arguments.ip,
      arguments.system_name,
      verbose: verbose,
      live: !flags.dry_run
    )
  end

  def help
    description = "Generate kubeconf files simply\n"
    long_description = Data.help_text

    puts [
      help_usage,
      description,
      help_arguments,
      help_flags,
      help_sub_commands,
      long_description,
    ].reject(&.strip.empty?).join("\n")
  end

  def check_command
    `which kubectl`

    abort("You must have `kubectl` installed and available on your PATH in order to use this tool") unless $?.success?
  end
end

Main.run

# Hack to prevent a segfault for static linking
{% if flag?(:static) %}
  require "llvm/lib_llvm"
  require "llvm/enums"
{% end %}