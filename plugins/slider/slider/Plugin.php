<?php namespace Slider\Slider;

use Backend;
use System\Classes\PluginBase;

/**
 * Slider Plugin Information File
 */
class Plugin extends PluginBase
{
    /**
     * Returns information about this plugin.
     *
     * @return array
     */
    public function pluginDetails()
    {
        return [
            'name'        => 'Slider',
            'description' => 'No description provided yet...',
            'author'      => 'Slider',
            'icon'        => 'icon-leaf'
        ];
    }

    /**
     * Register method, called when the plugin is first registered.
     *
     * @return void
     */
    public function register()
    {

    }

    /**
     * Boot method, called right before the request route.
     *
     * @return array
     */
    public function boot()
    {

    }

    /**
     * Registers any front-end components implemented in this plugin.
     *
     * @return array
     */
    public function registerComponents()
    {

        return [
            'Slider\Slider\Components\Slider' => 'slider',
        ];
    }

    /**
     * Registers any back-end permissions used by this plugin.
     *
     * @return array
     */
    public function registerPermissions()
    {
        return []; // Remove this line to activate

        return [
            'slider.slider.some_permission' => [
                'tab' => 'Slider',
                'label' => 'Some permission'
            ],
        ];
    }

    /**
     * Registers back-end navigation items for this plugin.
     *
     * @return array
     */
    public function registerNavigation()
    {

        return [
            'slider' => [
                'label'       => 'Слайдер',
                'url'         => Backend::url('slider/slider/slider'),
                'icon'        => 'icon-leaf',
                'permissions' => ['slider.slider.*'],
                'order'       => 500,
            ],
        ];
    }
}
