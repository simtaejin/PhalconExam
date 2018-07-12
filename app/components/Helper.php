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
        if (!$message) $message = "메세지를 입력 하세요.";

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
        } else if (is_array($arr)) {
            echo "<xmp>";
            print_r($arr);
            echo "</xmp>";
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

    public function set_thumbnail_images($board_id, $file_name, $width = "140", $height = "140") {
        echo $board_id."<br>";
        echo $file_name."<br>";
        echo $width."<br>";
        echo $height."<br>";
        if (!is_dir($this->config->application->dataDir . "/board/".$board_id."/thumbnail/")) {
            mkdir($this->config->application->dataDir . "/board/" . $board_id."/thumbnail/", 0777);
        }
        echo $this->config->application->dataDir . "board/".$board_id."/".$file_name;
        $image = new \Phalcon\Image\Adapter\Imagick( $this->config->application->dataDir ."board/".$board_id."/".$file_name);
    }

    public function get_thumbnail_images($board = "" , $file_name = "") {
        echo $board."<br>";
        echo $file_name."<br>";
        echo $width."<br>";
        echo $height."<br>";        
        
    }

}