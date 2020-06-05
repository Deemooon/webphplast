<?php

class LessonPlan extends Table
{
    public function validate()
    {
        try {
            if (!empty($this->gruppa_id) && !empty($this->subject_id) && !empty($this->user_id)) {
                return true;
            } else {
                throw new Exception('Не переданны все параметры');
            }
        } catch (Exception $ex) {
            return false;
        }

    }
}
