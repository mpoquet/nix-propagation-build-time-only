#include <cstdio>
#include <amazing/amazing.hpp>

void print_j(const amazing::json & j)
{
    if (amazing::is_object(j))
    {
        printf("object!\n");
    }
    else
    {
        printf("NOT object!\n");
    }
}

int main(void)
{
    amazing::json j;
    print_j(j);

    j["pi"] = 3.141;
    print_j(j);

    return 0;
}
