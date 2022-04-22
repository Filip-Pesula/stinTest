#include "HttpCore.h"
namespace STIN_Bot {
    Bot::Bot()
    {
    }

    Bot::~Bot()
    {
    }
    void http_server(tcp::acceptor& acceptor, tcp::socket& socket)
    {
        acceptor.async_accept(
            socket,
            [&](beast::error_code ec)
            {
                if (!ec)
                    //std::make_shared<http_connection>(std::move(socket))->start();
                    http_server(acceptor, socket);
            });
    }
}
