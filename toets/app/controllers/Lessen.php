<?php

class Lessen extends Controller
{

    public function __construct()
    {
        $this->lesModel = $this->model('Les');
    }

    public function index()
    {
        $result = $this->lesModel->getInstructor();
        if ($result) {
            $instructeurNaam = $result[0]->INNA;
            $instructeurAuto = $result[0]->INAU;
        } else {
            $instructeurNaam = '';
            $instructeurAuto = '';
        }
        var_dump($result);
        $rows = '';
        foreach ($result as $info) {
            $d = new DateTimeImmutable($info->DatumTijd, new DateTimeZone('Europe/Amsterdam'));
            $rows .= "<tr>
                        <td>{$d->format('d-m-Y')}</td>
                        <td>{$d->format('H:i')}</td>
                        <td>$info->LENA</td>
                        <td><a href='" . URLROOT . "/lessen/infolesson/{$info->Id}'><img src='" . URLROOT . "/img/b_help.png' alt='questionmark'></a></td>
                        <td><a href='" . URLROOT . "/lessen/topicslesson/{$info->Id}'><img src='" . URLROOT . "/img/b_props.png' alt='topiclist'></a></td>
                    </tr>";
        }

        $data = [
            'title' => "Overzicht Mankementen",
            'rows' => $rows,
            'instructeurNaam' => $instructeurNaam,
            'InstructeurAuto' => $instructeurAuto
        ];
        $this->view('lessen/index', $data);
    }

    function topicsLesson($lesId)
    {
        $result = $this->lesModel->getTopicsLesson($lesId);

        //var_dump($result);
        if ($result) {
            $d = new DateTimeImmutable($result[0]->DatumTijd, new DateTimeZone('Europe/Amsterdam'));
            $date = $d->format('d-m-Y');
            $time = $d->format('H:i');
        } else {
            $date = '';
            $time = '';
        }

        $rows = "";
        foreach ($result as $topic) {
            $rows .= "<tr>      
                        <td>$topic->Onderwerp</td>
                      </tr>";
        }


        $data = [
            'title' => 'Onderwerpen Les',
            'rows'  => $rows,
            'lesId' => $lesId,
            'date' => $date,
            'time' => $time
        ];
        $this->view('lessen/topicslesson', $data);
    }

    function addTopic($lesId = NULL)
    {
        $data = [
            'title' => 'Onderwerp Toevoegen',
            'lesId' => $lesId,
            'topic' => '',
            'topicError' => ''
        ];

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // var_dump($_POST);
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            $data = [
                'title' => 'Onderwerp Toevoegen',
                'lesId' => $_POST['lesId'],
                'topic' => $_POST['topic'],
                'topicError' => ''
            ];

            $data = $this->validateAddTopicForm($data);

            if (empty($data['topicError'])) {

                $result = $this->lesModel->addTopic($_POST);

                if ($result) {
                    echo "<p>Het nieuwe onderwerp is succesvol toegevoegd</p>";
                } else {
                    echo "<p>Het nieuwe onderwerp is niet toegevoegd</p>";
                }
                header('Refresh:3; url=' . URLROOT . '/lessen/index');
            } else {
                header('Refresh:3; url=' . URLROOT . '/lessen/addTopic/' . $data['lesId']);
            }
        }
        $this->view('lessen/addTopic', $data);
    }

    function addFeedback($lesId = NULL)
    {
        $data = [
            'title' => 'Opmerking Toevoegen',
            'lesId' => $lesId,
            'feedback' => '',
            'feedbackError' => ''
        ];

        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            // var_dump($_POST);
            $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

            $data = [
                'title' => 'Opmerking Toevoegen',
                'lesId' => $_POST['lesId'],
                'feedback' => $_POST['feedback'],
                'feedbackError' => ''
            ];

            $data = $this->validateAddFeedbackForm($data);

            if (empty($data['feedbackError'])) {

                $result = $this->lesModel->addFeedback($_POST);

                if ($result) {
                    echo "<p>De nieuwe opmerking is succesvol toegevoegd</p>";
                } else {
                    echo "<p>De nieuwe opmerking is niet toegevoegd</p>";
                }
                header('Refresh:3; url=' . URLROOT . '/lessen/index');
            } else {
                header('Refresh:3; url=' . URLROOT . '/lessen/addFeedback/' . $data['lesId']);
            }
        }
        $this->view('lessen/addFeedback', $data);
    }

    private function validateAddTopicForm($data)
    {
        if (strlen($data['topic']) > 255) {
            $data['topicError'] = 'Het nieuwe onderwerp heeft meer dan 255 letters.';
        } elseif (empty($data['topic'])) {
            $data['topicError'] = 'VUL HET VELD IN!!!';
        }

        return $data;
    }

    private function validateAddFeedbackForm($data)
    {
        if (strlen($data['feedback']) > 255) {
            $data['feedbackError'] = 'Het nieuwe onderwerp heeft meer dan 255 letters.';
        } elseif (empty($data['feedback'])) {
            $data['feedbackError'] = 'VUL HET VELD IN!!!';
        }

        return $data;
    }

    function infoLesson($lesId)
    {
        $result = $this->lesModel->getInfoLesson($lesId);

        var_dump($result);
        if ($result) {
            $d = new DateTimeImmutable($result[0]->DatumTijd, new DateTimeZone('Europe/Amsterdam'));
            $date = $d->format('d-m-Y');
            $time = $d->format('H:i');
        } else {
            $date = '';
            $time = '';
        }

        $rows = "";
        foreach ($result as $feedback) {
            $rows .= "<tr>      
                        <td>$feedback->Opmerking</td>
                      </tr>";
        }


        $data = [
            'title' => 'Les info',
            'rows'  => $rows,
            'lesId' => $lesId,
            'date' => $date,
            'time' => $time
        ];
        $this->view('lessen/infolesson', $data);
    }
}
