<?php namespace Slider\Slider\Components;

use Cms\Classes\ComponentBase;
use Slider\Slider\Models\Slider as SliderModel;

class Slider extends ComponentBase
{
    public function componentDetails()
    {
        return [
            'name'        => 'Slider Component',
            'description' => 'No description provided yet...'
        ];
    }
    public function getSlider()
    {
        return SliderModel::orderBy('id', 'desc')->take(4)->get();
    }

    public function defineProperties()
    {
        return [];
    }
}

