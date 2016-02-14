import std.stdio;
import std.random;
import std.conv;

void main()
{
    int x_dimension;
    int y_dimension;

    write(">> ");
    readf(" %s", &x_dimension);

    write(">> ");
    readf(" %s", &y_dimension);

    writeln();

    bool[][] puzzle_board;

    for(int x = 0; x < x_dimension; ++x)
    {
        bool[] puzzle_line;

        for(int y = 0; y < y_dimension; ++y)
        {
            auto random_num = uniform(0, 720);
            puzzle_line ~= (random_num % 2 == 0);
        }

        puzzle_board ~= puzzle_line;
    }

    int[][] x_sequences;
    int max_x_hints = 0;

    for(int x = 0; x < x_dimension; ++x)
    {
        int[] slice_sequences;
        int single_sequence = 0;
        bool should_add_end = true;

        for(int y = 0; y < y_dimension; ++y)
        {
            if(puzzle_board[x][y] == true)
            {
                ++single_sequence;
                should_add_end = true;
            }
            else
            {
                if(single_sequence > 0)
                {
                    slice_sequences ~= single_sequence;
                    single_sequence = 0;
                    should_add_end = false;
                }
            }
        }

        if(should_add_end)
        {
            slice_sequences ~= single_sequence;
        }

        if(to!int(slice_sequences.length) > max_x_hints)
        {
            max_x_hints = to!int(slice_sequences.length);
        }

        x_sequences ~= slice_sequences;
    }

    int[][] y_sequences;
    int max_y_hints;

    for(int y = 0; y <  y_dimension; ++y)
    {
        int[] slice_sequences;
        int single_sequence = 0;
        bool should_add_end = true;

        for(int x = 0; x < x_dimension; x++)
        {
            if(puzzle_board[x][y] == true)
            {
                ++single_sequence;
                should_add_end = true;
            }
            else
            {
                if(single_sequence > 0)
                {
                    slice_sequences ~= single_sequence;
                    single_sequence = 0;
                    should_add_end = false;
                }
            }
        }

        if(should_add_end)
        {
            slice_sequences ~= single_sequence;
        }

        if(to!int(slice_sequences.length) > max_y_hints)
        {
            max_y_hints = to!int(slice_sequences.length);
        }

        y_sequences ~= slice_sequences;
    }

    writeln();
    writeln("******");

    for(int x = 0; x < x_dimension; ++x)
    {
        writeln(puzzle_board[x]);
    }

    write(" ");

    for(int y = max_y_hints; y >= 0; --y)
    {
        for(int x = 0; x < max_x_hints; ++x)
        {
            write("   ");
        }

        write("   ");

        for(int col = 0; col < y_dimension; ++col)
        {
            if(to!int(y_sequences[col].length) > y)
            {
                write(y_sequences[col][(to!int(y_sequences[col].length) - 1) - y]);
            }
            else
            {
                if(y < max_y_hints)
                {
                    write(" ");
                }
            }

            write("   ");
        }

        writeln();
    }

    writeln();

    for(int row = 0; row < x_dimension; ++row)
    {
        for(int x = max_x_hints; x >= 0; --x)
        {
            if(x < max_x_hints)
            {
                write("  ");
            }

            if(to!int(x_sequences[row].length) > x)
            {
                write(x_sequences[row][(to!int(x_sequences[row].length) - 1) - x]);
            }
            else
            {
                if(x < max_x_hints)
                {
                    write(" ");
                }
            }
        }

        for(int y = 0; y < y_dimension; ++y)
        {
            write("   ");
            write(puzzle_board[row][y] ? "o" : "x");
        }

        writeln();
        writeln();
    }
}
