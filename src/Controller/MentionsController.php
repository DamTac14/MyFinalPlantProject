<?php
namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class MentionsController extends AbstractController
{
    #[Route('/mention-legales', name: 'mentions')]
    public function mentions(): Response
    {
        return $this->render('footer/mentions.html.twig');
    }
}
