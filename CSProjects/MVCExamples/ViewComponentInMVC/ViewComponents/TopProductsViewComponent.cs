using Microsoft.AspNetCore.Mvc;
using ViewComponentInMVC.Models;
namespace ViewComponentInMVC.ViewComponents
{
    public class TopProductsViewComponent : ViewComponent
    {
        public async Task<IViewComponentResult> InvokeAsync(int count)
        {
            // This is my logic for preparing data
            ProductRepository productRepository = new ProductRepository();
            var books = await productRepository.GetTopProductsAsync(count);
            return View(books);
        }
    }
}