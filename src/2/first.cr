module FlightComputer
  enum Opcode
    Add = 1
    Multiply = 2
    Halt = 99
  end
  alias Tape = Array(Int32)
  alias Result = Int32
  alias Input = Int32
  alias Instruction = Tuple(Opcode, Input, Input, Result)

  class Lexer
    def lex(input)
      o, i1, i2, r = (0..3).map { |i| input.fetch(i, 0) }
      Instruction.new(Opcode.new(o), i1, i2, r)
    end
  end

  class Parser
    alias Op = Proc(Instruction, Tape, Tape)
    DICTIONARY = {
      Opcode::Add => Op.new { |(_, i1, i2, r), tape| tape[r] = tape[i1] + tape[i2]; tape },
      Opcode::Multiply => Op.new { |(_, i1, i2, r), tape| tape[r] = tape[i1] * tape[i2]; tape } 
    }
    def parse(instruction)
      DICTIONARY[instruction.first].partial(instruction)
    end
  end

  class Interpreter
    def initialize(@program : Tape,
      @parser = Parser.new,
      @lexer = Lexer.new
    )
    end
    def execute
      @program.each_slice(4).each_with_object(@program) do |array, tape|
        instruction = @lexer.lex(array)
        break tape if instruction.first.halt?
        @parser.parse(instruction).call(tape)
      end
    end
  end
end
