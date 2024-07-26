<?php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Mime\Email;


class ContactController extends AbstractController
{
    #[Route('/contact', name: 'contact')]

    public function contact(Request $request, MailerInterface $mailer): Response
    {
        $form = $this->createFormBuilder()
            ->add('name', TextType::class, ['label' => 'Nom'])
            ->add('email', EmailType::class, ['label' => 'Email'])
            ->add('message', TextareaType::class, ['label' => 'Message'])
            ->add('send', SubmitType::class, ['label' => 'Envoyer'])
            ->getForm();

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $data = $form->getData();

            // Créez l'e-mail
            $email = (new Email())
                ->from($data['email'])
                ->to('mailer@fakedoe.com') 
                ->subject('Nouveau message de contact')
                ->text(
                    sprintf(
                        "Nom: %s\nEmail: %s\n\nMessage:\n%s",
                        $data['name'],
                        $data['email'],
                        $data['message']
                    )
                );

            // Envoyez l'e-mail
            $mailer->send($email);

            $this->addFlash('success', 'Votre message a été envoyé avec succès.');

            return $this->redirectToRoute('contact');
        }

        return $this->render('footer/contact.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
