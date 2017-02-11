<?php namespace Client\Accounting\Models;

use Model;
use Client\Client\Models\Client as ClientModel;
/**
 * Accounting Model
 */
class Accounting extends Model
{
    /**
     * @var string The database table used by the model.
     */
    public $table = 'client_accounting_accounting';

    /**
     * @var array Guarded fields
     */
    protected $guarded = ['*'];

    /**
     * @var array Fillable fields
     */
    protected $fillable = [];

    /**
     * @var array Relations
     */
    public $hasOne = [];
    public $hasMany = [];   
    public $belongsToMany = [];
    public $morphTo = [];
    public $morphOne = [];
    public $morphMany = [];
    public $attachOne = [];
    public $attachMany = [];

    public function getClientIdoptions() {
        $clients = ClientModel::all();
        return $clients->lists('name', 'id');
    }
    public function getClientAttribute() {
        $client = ClientModel::where('id', $this->client_id)->select('name')->first();
        return $client->name;
    }
}
