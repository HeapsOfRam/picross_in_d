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


    writeln(puzzle_board);
}
