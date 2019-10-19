﻿using DreamLeague.Services;
using System.Web.Mvc;

namespace DreamLeague.Controllers
{
    public class DownloadController : Controller
    {
        readonly IFileService fileService;

        public DownloadController()
        {
            fileService = new FileService();
        }

        public DownloadController(IFileService fileService)
        {
            this.fileService = fileService;
        }

        public ActionResult Index()
        {
            return View();
        }

        public FileResult Download(string fileName)
        {
            var fileBytes = fileService.GetBytesFromFile(fileName);

            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, fileName);
        }
    }
}