#include <nlohmann/json.hpp>

namespace amazing
{
    typedef nlohmann::json json;
    bool is_object(const json & j);
}
