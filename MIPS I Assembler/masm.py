import sys
import pathlib
import argparse
import lookup_table


def parse(line):
    fields = line.split("#")[0].split()
    if len(fields) == 0:
        return dict()

    fields = [field.lower() for field in fields]
    fields[1:] = [operand for operand in "".join(fields[1:]).split(",")]
    if fields[0] not in lookup_table.instruction:
        raise Exception("label or instruction expected at start of line")

    instruction = lookup_table.instruction[fields[0]]
    try:
        if fields[0] in ["addu", "subu", "and", "or", "xor", "nor", "sltu"]:
            (instruction["rd"], instruction["rs"], instruction["rt"]) = [lookup_table.register[field] for field in fields[1:]]
    except Exception:
        raise Exception("invalid combination of opcode and operands")

    return instruction


def main():
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("-o", metavar="outfile", help="write output to outfile", required=False, type=pathlib.Path, dest="outfile")
    arg_parser.add_argument("filename")
    args = arg_parser.parse_args()

    with open(args.filename, "rt") as fd:
        lines = fd.readlines()

    try:
        instructions = []
        for i in range(len(lines)):
            instruction = parse(lines[i])
            if len(instruction):
                instructions.append(instruction)
    except Exception as e:
        print(f"{sys.argv[1]}:{i + 1}: error: {e}")
        sys.exit(1)

    machine_code = ""
    for instruction in instructions:
        machine_code += "{:06b}".format(instruction["opcode"])
        if len(instruction) == 6:
            machine_code += "{:05b}".format(instruction["rs"])
            machine_code += "{:05b}".format(instruction["rt"])
            machine_code += "{:05b}".format(instruction["rd"])
            machine_code += "{:05b}".format(instruction["shamt"])
            machine_code += "{:06b}".format(instruction["funct"])
            machine_code += "\n"

    outfile = args.outfile if args.outfile else sys.argv[1].split(".")[0]
    with open(outfile, "wt+") as fd:
        fd.write(machine_code.strip())


if __name__ == "__main__":
    main()
