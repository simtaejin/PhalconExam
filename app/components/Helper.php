<?php

namespace Component;

class Helper extends \Phalcon\Mvc\User\Component
{
    public function csrf($redirect = false)
    {
        if ($this->security->checkToken() == false) {
            /*$this->flash->error('Invalid CSRF Token');
            if ($redirect) {
                $this->response->redirect($redirect);
            }*/
            $this->alert("Invalid CSRF Token", $redirect);

            return false;
        }
    }

    public function alert($message, $redirect = "")
    {
        if (!$message) {
            $message = "메세지를 입력 하세요.";
        }

        if ($redirect) {
            $url = "location.href='" . $redirect . "';";
        }

        $heredoc = <<< HERE
        <script type="text/javascript">
            alert('$message');
            $url
         </script>
HERE;
        echo $heredoc;

        return false;
    }

    public function printr($arr)
    {

        if (is_object($arr)) {
            echo "<xmp>";
            var_dump($arr);
            echo "</xmp>";
        } else {
            if (is_array($arr)) {
                echo "<xmp>";
                print_r($arr);
                echo "</xmp>";
            }
        }

        return false;
    }

    public function dateformate($format = "Y-m-d H:i:s", $str)
    {
        $temp = "";
        if ($str) {
            $temp = date($format, strtotime($str));
        }

        return $temp;
    }

    public function is_file_check($board_id, $file_name)
    {
        if (file_exists($this->config->application->dataDir."/board/".$board_id."/".$file_name)) {
            return  true;
        } else {
            return false;
        }

    }

}