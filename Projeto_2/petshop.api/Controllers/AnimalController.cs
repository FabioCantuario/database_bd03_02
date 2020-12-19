using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using petshop.api.Model;
using petshop.api.Services;

namespace petshop.api.Controllers
{
    [Route("api[controller]")]
    [ApiController]
    public class AnimalController : Controller
    {
        public readonly MongoDbService _mongoDbService;

        public AnimalController(){
            _mongoDbService = new MongoDbService("AnimalDatabase","Animal","mongodb://localhost:127.0.0.1:27017")
        }

        public async Task Cadastrar([FromBody] Animal animal){
            await _mongoDbService.Insere(animal);
            
        }
    }
}