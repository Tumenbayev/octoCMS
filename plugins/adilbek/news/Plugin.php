<?php namespace Adilbek\News;

use Backend;
use System\Classes\PluginBase;

/**
 * news Plugin Information File
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
            'name'        => 'news',
            'description' => 'News module for October CMS',
            'author'      => 'Adilbek',
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
        // return []; // Remove this line to activate

        return ['Adilbek\News\Components\News' => 'news'];

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
            'adilbek.news.some_permission' => [
                'tab' => 'news',
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
             'catalog' => [
                 'label'       => 'Список новостей',
                 'url'         => \Backend::url('adilbek/news/news'),
                 'icon'        => 'icon-list-alt',
                 'order'       => 500,
                 'sideMenu' => [
                     'products' => [
                         'label'       => 'Новости',
                         'icon'        => 'icon-list-alt',
                         'url'         => \Backend::url('adilbek/news/news'),
                     ],
                 ]

             ]
         ];
     }
}
