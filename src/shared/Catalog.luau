return {
    Categories = { "CPU", "GPU", "RAM" },
    StartingCash = 100,
    RestockSeconds = 90,
    Items = {
        { Id = "new_cpu", Category = "CPU", Name = "Starter CPU", Price = 30 },
        { Id = "new_gpu", Category = "GPU", Name = "Starter GPU", Price = 45 },
        { Id = "new_ram", Category = "RAM", Name = "Starter RAM", Price = 20 },
        { Id = "used_cpu", Category = "CPU", Name = "Used CPU", Price = 20, Stock = 1 },
        { Id = "used_gpu", Category = "GPU", Name = "Used GPU", Price = 30, Stock = 1 },
        { Id = "used_ram", Category = "RAM", Name = "Used RAM", Price = 10, Stock = 1 },
    },
}
