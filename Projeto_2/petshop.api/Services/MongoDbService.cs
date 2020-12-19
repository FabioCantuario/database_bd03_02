using petshop.api.Model;
using MongoDB.Driver;
using System.Threading.Tasks;

namespace petshop.api.Services
{
    public class MongoDbService
    {
        private IMongoCollection<Animal> AnimalCollection { get;}

        public MongoDbService(string database, string collection, string databaseUrl)
        {
            var mongoClient = new mongoClient(databaseUrl);
            var mongoDatabase = mongoClient.GetDatabase(database);
            AnimalCollection = mongoDatabase.GetCollection<Animal>(collection);
        }

        // CRUD

        // Pegar Animal

        public Animal Get (string id) => AnimalCollection
             .Find<Animal>(Animal => Animal.Id == id).FirstOrDefault();
        
        public async Task Insere(Animal animal) => await AnimalCollection.InsertOneAsync(animal);


    }
}