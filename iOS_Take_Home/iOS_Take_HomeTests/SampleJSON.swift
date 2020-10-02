//
//  SampleJSON.swift
//  iOS_Take_HomeTests
//
//  Created by Chad Rutherford on 10/1/20.
//

import Foundation

func sampleJSON() -> Data {
	"""
	{
	  "campaigns": [
		{
		  "id": 1,
		  "campaign_name": "Tiktok",
		  "campaign_icon_url": "https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/11/d7/70/11d770fa-14d6-e6ee-b118-c273bcf91906/AppIcon_TikTok-1x_U007emarketing-85-220-0-5.png/230x0w.jpg",
		  "pay_per_install": "19.8",
		  "medias": [
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/tiktok%2F44f871ab-a7de-4bcc-9ecf-4ecadbc5bc83.png?alt=media&token=ea854bfa-5fb7-4b23-b85c-312ae9860338",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/tiktok%2F44f871ab-a7de-4bcc-9ecf-4ecadbc5bc83.mp4?alt=media&token=9580e0d2-f07e-4c78-bcab-d1b26d2c525a",
			  "tracking_link": "www.plugco.in/tiktok/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/tiktok%2F1403e07a-24f0-4fef-9022-ffc433b0e767.png?alt=media&token=cf325104-5736-41e9-b79d-08644f79da8b",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/tiktok%2F1403e07a-24f0-4fef-9022-ffc433b0e767.mp4?alt=media&token=e11aa682-482e-45f5-875e-06c60da8f04b",
			  "tracking_link": "www.plugco.in/tiktok/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/tiktok%2F47766c1f-e280-428f-a22d-e9cf8765e259.png?alt=media&token=ae393f4e-ca3f-42d7-aa55-25f3285d73c5",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/tiktok%2F47766c1f-e280-428f-a22d-e9cf8765e259.mp4?alt=media&token=3adb2011-a671-4ff0-9230-3d6c3b16ad97",
			  "tracking_link": "www.plugco.in/tiktok/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/tiktok%2F5868ea0f-abd2-495b-a8bc-cf169d547d13.png?alt=media&token=46347dca-1a68-41dc-8d0c-2fcffd8bb9ed",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/tiktok%2F5868ea0f-abd2-495b-a8bc-cf169d547d13.mp4?alt=media&token=ea11ceef-371d-4e30-b7df-7694e63bd69f",
			  "tracking_link": "www.plugco.in/tiktok/2",
			  "media_type": "video"
			}
		  ]
		},
		{
		  "id": 2,
		  "campaign_name": "Yarn",
		  "campaign_icon_url": "https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/17/77/65/17776586-c576-6a59-ede3-15790fe01d02/source/512x512bb.jpg",
		  "pay_per_install": "22.1",
		  "medias": [
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/yarn2%2Fd7615446-66f7-49be-b495-0c5f59153553.png?alt=media&token=08feaad6-eb0f-451c-820a-e3f9b0f78f89",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/yarn2%2Fd7615446-66f7-49be-b495-0c5f59153553.mp4?alt=media&token=bf3b8bdd-6715-4c59-8925-e7a13fcb9218",
			  "tracking_link": "www.plugco.in/yarn2/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/yarn2%2Fdf36a0cb-14c6-4cc2-a6d8-5797353ad7b6.png?alt=media&token=00429e77-9062-47ca-a3b9-ff604eda9a0a",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/yarn2%2Fdf36a0cb-14c6-4cc2-a6d8-5797353ad7b6.mp4?alt=media&token=2c22b307-49ba-4b21-aab9-52e95681e987",
			  "tracking_link": "www.plugco.in/yarn2/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/yarn2%2Fe41949f2-cd48-41db-9645-559a60f9092c.png?alt=media&token=43d4b8c8-eed6-4f4b-a438-7bacda80574e",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/yarn2%2Fe41949f2-cd48-41db-9645-559a60f9092c.mp4?alt=media&token=6a920bca-4d55-4fdf-bd27-8af7b461415a",
			  "tracking_link": "www.plugco.in/yarn2/2",
			  "media_type": "video"
			}
		  ]
		},
		{
		  "id": 3,
		  "campaign_name": "Pottery",
		  "campaign_icon_url": "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/d0/a3/64/d0a364f7-3d4f-a05c-bb8e-668992168e05/source/512x512bb.jpg",
		  "pay_per_install": "7.2",
		  "medias": [
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/pottery%2Fa01229b5-e97d-49f4-b82d-1d6d6bc94640.png?alt=media&token=fd2e9c97-89c9-42dd-80b7-967d5ec21da8",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/pottery%2Fa01229b5-e97d-49f4-b82d-1d6d6bc94640.mp4?alt=media&token=90565087-93d0-4fda-85ce-6ecbc87822e9",
			  "tracking_link": "www.plugco.in/pottery/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/pottery%2F016aa9b1-8de6-4ea8-8404-94f73ecd82ca.png?alt=media&token=98e86303-8618-4e31-9acf-f972e303412d",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/pottery%2F016aa9b1-8de6-4ea8-8404-94f73ecd82ca.mp4?alt=media&token=c31cd859-efa6-4351-836a-2e92f800808a",
			  "tracking_link": "www.plugco.in/pottery/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/pottery%2Fec6af5c4-af9d-4762-9492-e2b883686011.png?alt=media&token=2871d7ca-0d43-4151-9987-fa1b665be3ee",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/pottery%2Fec6af5c4-af9d-4762-9492-e2b883686011.mp4?alt=media&token=5b302a40-2c39-42d3-a5e2-7a7d374866cc",
			  "tracking_link": "www.plugco.in/pottery/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/pottery%2F06b80e4b-d32d-42af-94da-12241823d199.png?alt=media&token=96555ee7-d08e-40fe-a38e-c8bd31a80fff",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/pottery%2F06b80e4b-d32d-42af-94da-12241823d199.mp4?alt=media&token=6f5732e1-2d61-4a20-bbc6-2d906ec1fe20",
			  "tracking_link": "www.plugco.in/pottery/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/pottery%2F1069253b-a226-4afa-8ace-7b7892920367.png?alt=media&token=46176053-6677-4cf7-8d2a-3b15fd37d7b9",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/pottery%2F1069253b-a226-4afa-8ace-7b7892920367.mp4?alt=media&token=a6bf3d90-664b-4876-805f-b657cce67485",
			  "tracking_link": "www.plugco.in/pottery/2",
			  "media_type": "video"
			}
		  ]
		},
		{
		  "id": 4,
		  "campaign_name": "Calm",
		  "campaign_icon_url": "https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/02/d5/22/02d522da-69cb-4416-1bc4-9664a01d7e92/source/512x512bb.jpg",
		  "pay_per_install": "22.3",
		  "medias": [
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/calm%2F7eb1ab1d-1487-4093-8ea8-0b3d4881870a.png?alt=media&token=e54a4427-cd3e-443d-9f10-a900aca4f552",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/calm%2F7eb1ab1d-1487-4093-8ea8-0b3d4881870a.mp4?alt=media&token=5db1cf3c-de88-41e9-af17-ce470de74d55",
			  "tracking_link": "www.plugco.in/calm/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/calm%2F27d2d833-c122-4358-ab46-f2cac5d05aea.png?alt=media&token=b0a1600f-c0a8-4b99-abb7-bf3c6f84670d",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/calm%2F27d2d833-c122-4358-ab46-f2cac5d05aea.mp4?alt=media&token=78b06a34-cfbc-4d92-bc34-1849f09ea211",
			  "tracking_link": "www.plugco.in/calm/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/calm%2Fa8b42eb7-eb47-48c6-baf4-f5d3d13afa46.png?alt=media&token=227c82c9-3915-4a47-817f-fa7f67dee57b",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/calm%2Fa8b42eb7-eb47-48c6-baf4-f5d3d13afa46.mp4?alt=media&token=0567d98c-9ce3-4c43-8166-000510941a6e",
			  "tracking_link": "www.plugco.in/calm/2",
			  "media_type": "video"
			}
		  ]
		},
		{
		  "id": 5,
		  "campaign_name": "Jetpack Jump",
		  "campaign_icon_url": "https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/5b/23/75/5b2375b9-1055-274f-7227-72001ab04cdf/source/512x512bb.jpg",
		  "pay_per_install": "8.9",
		  "medias": [
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/jetpackjump%2F5dc93f2b-377d-4e28-b145-5f930e45218f.png?alt=media&token=118431e2-05a3-4fb5-b793-5f7d69ae46be",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/jetpackjump%2F5dc93f2b-377d-4e28-b145-5f930e45218f.mp4?alt=media&token=ffe53a20-40d7-40b0-a6a7-2de82de57ca0",
			  "tracking_link": "www.plugco.in/jetpackjump/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/jetpackjump%2F4368bbd1-3123-4240-a042-a6a511a52b4a.png?alt=media&token=0939c688-0f01-45ad-9013-3b348e96e456",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/jetpackjump%2F4368bbd1-3123-4240-a042-a6a511a52b4a.mp4?alt=media&token=97c46646-a7f5-4184-b12f-f72784372756",
			  "tracking_link": "www.plugco.in/jetpackjump/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/jetpackjump%2F3a804ca5-0126-48c6-80e0-f76bc5a58323.png?alt=media&token=2c7b85bb-7b09-43bc-89c4-84764cf489ad",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/jetpackjump%2F3a804ca5-0126-48c6-80e0-f76bc5a58323.mp4?alt=media&token=64141643-6d0a-43c6-a73b-0845761a13f0",
			  "tracking_link": "www.plugco.in/jetpackjump/2",
			  "media_type": "video"
			}
		  ]
		},
		{
		  "id": 6,
		  "campaign_name": "Astrology & Palmistry Coach",
		  "campaign_icon_url": "https://is1-ssl.mzstatic.com/image/thumb/Purple113/v4/27/27/43/272743a4-ed0d-d9aa-03d9-29f6836d89a2/source/512x512bb.jpg",
		  "pay_per_install": "6.1",
		  "medias": [
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/astrologyandpalmistrycoach%2F8f80d4b5-d484-4dd0-90bf-b08ef775f7d6.png?alt=media&token=8d45dca1-5ed8-4d0b-a183-ffd1213d7114",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/astrologyandpalmistrycoach%2F8f80d4b5-d484-4dd0-90bf-b08ef775f7d6.mp4?alt=media&token=5b277edf-18d0-4c2d-b9e8-a139eb429729",
			  "tracking_link": "www.plugco.in/astrologyandpalmistrycoach/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/astrologyandpalmistrycoach%2Ff0545298-ee7c-4327-86d8-8860ab64dc47.png?alt=media&token=16833b18-9162-4818-ac42-838fdb983669",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/astrologyandpalmistrycoach%2Ff0545298-ee7c-4327-86d8-8860ab64dc47.mp4?alt=media&token=75464b4d-c864-4077-97c0-566af2eae5fc",
			  "tracking_link": "www.plugco.in/astrologyandpalmistrycoach/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/astrologyandpalmistrycoach%2F368ea7ea-134e-4248-8f5b-7f0a9c80b978.png?alt=media&token=95f610fa-7ca9-4fab-8040-a90e3d75e43d",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/astrologyandpalmistrycoach%2F368ea7ea-134e-4248-8f5b-7f0a9c80b978.mp4?alt=media&token=ce04556c-c08c-46f1-a161-6b07c98accd1",
			  "tracking_link": "www.plugco.in/astrologyandpalmistrycoach/2",
			  "media_type": "video"
			}
		  ]
		},
		{
		  "id": 7,
		  "campaign_name": "Joyride",
		  "campaign_icon_url": "https://is2-ssl.mzstatic.com/image/thumb/Purple124/v4/1f/8d/eb/1f8debde-05e1-52e1-e2f5-8e9f8584f38f/source/512x512bb.jpg",
		  "pay_per_install": "12.0",
		  "medias": [
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/joyride%2F44a8212a-f283-45e5-9ae0-70a95a874882.png?alt=media&token=746ef8ae-25fd-448b-844a-c8d232626adc",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/joyride%2F44a8212a-f283-45e5-9ae0-70a95a874882.mp4?alt=media&token=1b802d64-c9de-44d5-b877-38fb0c6d27e4",
			  "tracking_link": "www.plugco.in/joyride/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/joyride%2Ff480bc14-e15d-4a9d-b203-9744f75d2f7c.png?alt=media&token=48b5096f-5bc4-43a5-a280-c27627c88e27",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/joyride%2Ff480bc14-e15d-4a9d-b203-9744f75d2f7c.mp4?alt=media&token=79c12670-9c48-4fe6-8789-41c44a856efc",
			  "tracking_link": "www.plugco.in/joyride/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/joyride%2F63233363-f7c6-4ecf-87ec-99b220110f66.png?alt=media&token=5e93dc49-95db-44a4-b309-a83e43977f97",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/joyride%2F63233363-f7c6-4ecf-87ec-99b220110f66.mp4?alt=media&token=8bb85e9f-25bb-4804-9905-d4b71a5619a9",
			  "tracking_link": "www.plugco.in/joyride/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/joyride%2F96f3d019-9ff9-48ad-abea-338c3c88551a.png?alt=media&token=41f21e54-d27b-4272-b587-32a0f6949a68",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/joyride%2F96f3d019-9ff9-48ad-abea-338c3c88551a.mp4?alt=media&token=71e37507-bad4-4a62-b8d8-9b089589459f",
			  "tracking_link": "www.plugco.in/joyride/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/joyride%2F5aa6206d-ae74-4271-b468-5538802e7632.png?alt=media&token=ce3867d0-86e3-4fd5-a367-3674cce5776e",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/joyride%2F5aa6206d-ae74-4271-b468-5538802e7632.mp4?alt=media&token=c0099724-dcf7-429e-9062-9f2726ea460d",
			  "tracking_link": "www.plugco.in/joyride/2",
			  "media_type": "video"
			}
		  ]
		},
		{
		  "id": 8,
		  "campaign_name": "Rope 'n' Roll",
		  "campaign_icon_url": "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/af/1c/2f/af1c2fdd-a45e-f09a-5d4e-4358052003d4/source/512x512bb.jpg",
		  "pay_per_install": "9.9",
		  "medias": [
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/ropenroll%2Fbe875036-e947-421b-b6c7-57c403eb2e9e.png?alt=media&token=c1b43e34-5fbf-430f-9068-98e7c8006af9",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/ropenroll%2Fbe875036-e947-421b-b6c7-57c403eb2e9e.mp4?alt=media&token=919a590d-f604-49e0-bd4e-63a987f1df92",
			  "tracking_link": "www.plugco.in/ropenroll/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/ropenroll%2Fdff1e39c-0f73-48f5-a8fa-a688b28b4c21.png?alt=media&token=71846d7a-98cb-46d1-be07-23d6c950f409",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/ropenroll%2Fdff1e39c-0f73-48f5-a8fa-a688b28b4c21.mp4?alt=media&token=3b6dc3ef-c572-4e93-aafe-d81d27bf09ed",
			  "tracking_link": "www.plugco.in/ropenroll/2",
			  "media_type": "video"
			},
			{
			  "cover_photo_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/ropenroll%2F4bb64dd4-6661-41ce-a3e1-574fbea1c34f.png?alt=media&token=bf24acb2-51db-4632-8dd6-29bfcafebe6c",
			  "download_url": "https://firebasestorage.googleapis.com/v0/b/plugcoinprod.appspot.com/o/ropenroll%2F4bb64dd4-6661-41ce-a3e1-574fbea1c34f.mp4?alt=media&token=db2a2957-2aa4-4074-8c1e-d4c122638d0a",
			  "tracking_link": "www.plugco.in/ropenroll/2",
			  "media_type": "video"
			}
		  ]
		}
	  ]
	}
	""".data(using: .utf8)!
}
