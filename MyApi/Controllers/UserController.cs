using Microsoft.AspNetCore.Mvc;
using System.Linq;

[Route("api/[controller]")]
[ApiController]
public class UserController : ControllerBase
{
    private readonly MyDbContext _context;

    public UserController(MyDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public IActionResult GetUsers()
    {
        var users = _context.Users.ToList();
        return Ok(users);
    }
}
