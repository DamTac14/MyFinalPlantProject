<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;


class ApiController extends AbstractController
{

    #[Route('/api/data', name: 'api_get_data')]
    public function getData(): JsonResponse
    {
        $data = [
            [
                'région' => 'Europe',
                'types_plantes' => ['Fleur', 'Arbre', 'Arbuste', 'Plante grimpante'],
                'température' => '0-25°C'
            ],
            [
                'région' => 'Asie',
                'types_plantes' => ['Plante grimpante', 'Cactus', 'Orchidée', 'Palmier'],
                'température' => '10-35°C'
            ],
            [
                'région' => 'Amérique du Nord',
                'types_plantes' => ['Conifère', 'Herbacée', 'Succulente', 'Plante aquatique'],
                'température' => '-10-30°C'
            ],
            [
                'région' => 'Amérique du Sud',
                'types_plantes' => ['Fougère', 'Cactus', 'Plante tropicale', 'Arbre fruitier'],
                'température' => '15-40°C'
            ],
            [
                'région' => 'Afrique',
                'types_plantes' => ['Plante succulente', 'Graminée', 'Arbre d’ombre', 'Plante médicinale'],
                'température' => '20-45°C'
            ],
            [
                'région' => 'Océanie',
                'types_plantes' => ['Plante vivace', 'Arbuste', 'Palmier', 'Herbacée'],
                'température' => '10-30°C'
            ],
            [
                'région' => 'Antarctique',
                'types_plantes' => ['Plante de glace', 'Mousse', 'Lichen'],
                'température' => '-30-0°C'
            ],
            [
                'région' => 'Arctique',
                'types_plantes' => ['Mousse', 'Lichen', 'Herbe de réchauffement'],
                'température' => '-20-10°C'
            ]
        ];

        return new JsonResponse($data);
    }

    #[Route('/regions', name: 'region_page')]
    public function dataPage(): Response
    {
        return $this->render('api/region.html.twig');
    }

}
