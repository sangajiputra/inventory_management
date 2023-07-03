<?php
namespace App\libraries;

use App\Models\ExternalLink;
use URL;

trait ShareableLink {

    public function getShareableLinkAttribute()
    {
        $externalLink = ExternalLink::where(['object_id' => $this->id, 'object_type' => $this->getTable()])->first();

        if(empty($externalLink)) {
            $externalLink = $this->generateLink( $this->id, $this->getTable());
        }

        return  URL::to('/') .'/'. 'shareable-link'. '/' .strtolower($externalLink['object_type']) . '/' . $externalLink['object_key'];
    }

    public function generateLink($id = null, $type = null)
	{
		$info['object_type'] = $type;
		$info['object_id'] = $id;
		$info['object_key'] = bin2hex(random_bytes(20));
		$info['created_at'] = date('Y-m-d H:i:s');
		ExternalLink::insert($info);
		return $info;
		
	}
}