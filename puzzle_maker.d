import std.stdio;
import std.random;

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

        x_sequences ~= slice_sequences;
    }

    int[][] y_sequences;

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
                //writeln("sequence++");
                //writeln("%d, %d", x, y);
            }
            else
            {
                if(single_sequence > 0)
                {
                    slice_sequences ~= single_sequence;
                    single_sequence = 0;
                    should_add_end = false;

                    //writeln("sequence append");
                    //writeln("%d, %d", x, y);
                }
            }
        }

        if(should_add_end)
        {
            slice_sequences ~= single_sequence;
        }

        y_sequences ~= slice_sequences;
    }

    writeln("---X---");
    for(int x = 0; x < x_sequences.length; ++x)
    {
        writeln(x_sequences[x]);
    }


    writeln("---Y---");
    for(int y = 0; y < y_sequences.length; ++y)
    {
        writeln(y_sequences[y]);
    }

    writeln();
    writeln("******");

    for(int x = 0; x < x_dimension; ++x)
    {
        writeln(puzzle_board[x]);
    }
}
