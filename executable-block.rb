# Minimalist Executable Block for MatrixLab

class ExecutableBlock
  def initialize(substrate_file)
    @substrate_file = substrate_file
  end

  # Main execution function
  def activate(instruction)
    substrate = read_substrate
    updated_substrate = process_substrate(substrate, instruction)
    write_substrate(updated_substrate)
  end

  private

  # Reads the substrate from the file
  def read_substrate
    File.read(@substrate_file).strip
  end

  # Processes the substrate based on the given instruction
  def process_substrate(substrate, instruction)
    "#{instruction}: #{substrate.reverse}" # Example transformation
  end

  # Writes the updated substrate back to the file
  def write_substrate(updated_substrate)
    File.open(@substrate_file, "w") { |file| file.puts(updated_substrate) }
  end
end

# Example usage
if __FILE__ == $PROGRAM_NAME
  # Ensure substrate file and instruction are provided
  substrate_file = ARGV[0]
  instruction = ARGV[1] || "Default Instruction"

  if substrate_file.nil?
    puts "Usage: ruby executable-block.rb <substrate_file> [instruction]"
    exit
  end

  block = ExecutableBlock.new(substrate_file)
  block.activate(instruction)
end